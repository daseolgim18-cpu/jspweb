package filter;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.FileWriter;

public class LogFileFilter implements Filter {

    // 멀티스레드 환경에서 안전하게 사용하기 위해 전역 변수로 관리
    private PrintWriter writer;

    @Override
    public void init(FilterConfig config) throws ServletException {
        String filename = config.getInitParameter("filename");
        if (filename == null) {
            throw new ServletException("로그 파일의 이름을 찾을 수 없습니다.");
        }

        try {
            // true: 이어쓰기(append) 모드, 뒤의 true: Auto-flush 모드
            writer = new PrintWriter(new FileWriter(filename, true), true);
        } catch (IOException e) {
            throw new ServletException("로그 파일을 열 수 없습니다.", e);
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        long start = System.currentTimeMillis();
        String clientIP = request.getRemoteAddr();
        String urlPath = getURLPath(request);
        String startTime = getCurrentTime();

        // 1. 다음 필터 또는 서블릿으로 요청 전달 (실제 핵심 비즈니스 로직 실행)
        chain.doFilter(request, response);

        long end = System.currentTimeMillis();
        String endTime = getCurrentTime();
        long executionTime = end - start;

        // 2. 동시성 문제를 방지하기 위해 로그 출력을 synchronized 블록으로 묶음
        if (writer != null) {
            synchronized (writer) {
                writer.println(" 접속한 클라이언트 IP : " + clientIP);
                writer.println(" 접근한 URL 경로 : " + urlPath);
                writer.println(" 요청 처리 시작 시각 : " + startTime);
                writer.println(" 요청 처리 종료 시각 : " + endTime);
                writer.println(" 요청 처리 소요 시간 : " + executionTime + "ms");
                writer.println(" =============================================");
            }
        }
    }

    @Override
    public void destroy() {
        // [수정] 톰캣 종료나 웹 앱 언로드 시, 열려 있는 파일 스트림을 반드시 닫아줌 (메모리 누수 방지)
        if (writer != null) {
            writer.close();
        }
    }
    
    private String getURLPath(ServletRequest request) {
        HttpServletRequest req;
        String currentPath = "";
        String queryString = "";
        if (request instanceof HttpServletRequest) {
            req = (HttpServletRequest) request;
            currentPath = req.getRequestURI();
            queryString = req.getQueryString();
            queryString = (queryString == null) ? "" : "?" + queryString;
        }
        return currentPath + queryString;
    }

    private String getCurrentTime() {
        DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(System.currentTimeMillis());
        return formatter.format(calendar.getTime());
    }
}