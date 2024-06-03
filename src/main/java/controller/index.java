package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/index")
@MultipartConfig
public class index extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
		response.sendRedirect("index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
		System.out.println("post");

		/*
        Part part = request.getPart("fileupload1");
        System.out.println("part : "+part);
        String realpath = "";
        realpath = part.getSubmittedFileName();
        System.out.println("realpath : "+realpath);
		if(realpath==null || realpath.equals("")) {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('검사할 파일을 첨부해야 합니다.');");
			out.print("location.href = 'index'");
			out.print("</script>");	
			return;
		}
		String targetURL = "http://localhost:5000/server";
        String jsonInputString = "{\"key1\": \"value1\", \"key2\": \"value2\"}";

        URL url = new URL(targetURL);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json; utf-8");
        con.setRequestProperty("Accept", "application/json");
        con.setDoOutput(true);

        try (OutputStream os = con.getOutputStream()) {
            byte[] input = jsonInputString.getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        try (BufferedReader br = new BufferedReader(
                new InputStreamReader(con.getInputStream(), "utf-8"))) {
            StringBuilder responseStr = new StringBuilder();
            String responseLine = null;
            while ((responseLine = br.readLine()) != null) {
                responseStr.append(responseLine.trim());
            }
            response.getWriter().write(responseStr.toString());
            request.setAttribute("content", responseStr.toString());
        }
*/
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}
}
