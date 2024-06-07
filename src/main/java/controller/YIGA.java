package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/YIGA")
@MultipartConfig
public class YIGA extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
		response.sendRedirect("YIGA.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        
        Part part = request.getPart("filename");
        String realpath = "", realfilename = "", randfilename = "";
    	realfilename = part.getSubmittedFileName();
    	if(realfilename==null) realfilename = "";
        
    	if(realfilename.equals("")) {
			PrintWriter out = response.getWriter();
		    out.print("<script>");
		    out.print("alert('전송할 파일을 선택하세요.');");
		    out.print("location.href = 'YIGA.jsp'");
		    out.print("</script>");
		    return;
        }

    	realpath =request.getSession().getServletContext().getRealPath("/");
		randfilename = fileupload(part, realpath, realfilename);
        
        String sentfilepath = randfilename;
        File file = new File(sentfilepath);
        
        if(!file.exists()) {
			PrintWriter out = response.getWriter();
		    out.print("<script>");
		    out.print("alert('전송할 파일이 존재하지 않습니다!');");
		    out.print("location.href = 'YIGA.jsp'");
		    out.print("</script>");
        }
        
        String boundary = "^-----^";
        String LINE_FEED = "\r\n";
        String charset = "UTF-8";
        OutputStream outputStream;
        PrintWriter writer;

        String result = null;
        try{

            URL url = new URL("http://127.0.0.1:5000/server");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            connection.setRequestProperty("Content-Type", "multipart/form-data;charset=utf-8;boundary=" + boundary);
            connection.setRequestMethod("POST");
            connection.setDoInput(true);
            connection.setDoOutput(true);
            connection.setUseCaches(false);
            connection.setConnectTimeout(15000);

            outputStream = connection.getOutputStream();
            writer = new PrintWriter(new OutputStreamWriter(outputStream, charset), true);

            writer.append("--" + boundary).append(LINE_FEED);
            writer.append("Content-Disposition: form-data; name=\"file\"").append(LINE_FEED);
            writer.append("Content-Type: text/plain; charset=" + charset).append(LINE_FEED);
            writer.append(LINE_FEED);
            writer.append("데이터값").append(LINE_FEED);
            writer.flush();

            writer.append("--" + boundary).append(LINE_FEED);
            writer.append("Content-Disposition: form-data; name=\"file\"; filename=\"" + file.getName() + "\"").append(LINE_FEED);
            writer.append("Content-Type: " + URLConnection.guessContentTypeFromName(file.getName())).append(LINE_FEED);
            writer.append("Content-Transfer-Encoding: binary").append(LINE_FEED);
            writer.append(LINE_FEED);
            writer.flush();

            FileInputStream inputStream = new FileInputStream(file);
            byte[] buffer = new byte[(int)file.length()];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            outputStream.flush();
            inputStream.close();
            writer.append(LINE_FEED);
            writer.flush();

            writer.append("--" + boundary + "--").append(LINE_FEED);
            writer.close();

            int responseCode = connection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK || responseCode == HttpURLConnection.HTTP_CREATED) {
                BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                String inputLine;
                StringBuffer responseBuf = new StringBuffer();
                while ((inputLine = in.readLine()) != null) {
                	responseBuf.append(inputLine);
                }
                in.close();
                
                result = responseBuf.toString();
                System.out.println("result : "+result);
            } else {
                BufferedReader in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
                String inputLine;
                StringBuffer responseBuf = new StringBuffer();
                while ((inputLine = in.readLine()) != null) {
                	responseBuf.append(inputLine);
                }
                in.close();
                result = responseBuf.toString();
                System.out.println("result : "+result);
            }
        } catch (Exception e) {
        	e.printStackTrace();
        }

		RequestDispatcher dispatcher = request.getRequestDispatcher("YIGA.jsp");
		dispatcher.forward(request, response);
	}

	String fileupload(Part part, String realpath, String realname) {
		String dir = realpath+"upload\\"+realname;
        try {
        	System.out.println("write : "+dir);
			part.write(dir);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("Error fileupload");
		}

        return dir;
	}
}
