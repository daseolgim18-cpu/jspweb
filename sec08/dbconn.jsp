<%@ page import="java.sql.*" %>

<%
    Connection conn = null;

    try {

        // 1. 오라클 연결 URL 설정
        // XE 기준
        String url = "jdbc:oracle:thin:@localhost:1521:xe";

        // 계정 정보
        String user = "system";
        String password = "oracle";

        // 2. JDBC 드라이버 로드
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // 3. 커넥션 연결
        conn = DriverManager.getConnection(url, user, password);

        out.println("DB 연결 성공!");

    } catch (Exception e) {

        out.println("DB 연결 실패: " + e.getMessage());

    } finally {

        if (conn != null) {
            try {
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
%>