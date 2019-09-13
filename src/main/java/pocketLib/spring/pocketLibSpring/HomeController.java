package pocketLib.spring.pocketLibSpring;

import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import pocketLib.spring.pocketLibSpring.mybatis.model.Customer;
import pocketLib.spring.pocketLibSpring.mybatis.model.Searching;
import pocketLib.spring.pocketLibSpring.mybatis.service.SearchingService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	SearchingService searchingService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Customer userInfo = (Customer) session.getAttribute("userInfo");
		if (userInfo == null) {
			userInfo = null;
		}
		
		List<Searching> searchingList = null;
		try {
			searchingList = searchingService.CSVList(null);
		} catch (Exception e) {
			e.getStackTrace();
		}
		/**
		ArrayList<Searching> list = (ArrayList<Searching>) searchingList;

		BufferedWriter bufWriter = null;
		try {
			bufWriter = Files.newBufferedWriter(Paths.get("C:/Choiutaek/workspace-jsp/pocketlib/src/main/webapp/WEB-INF/views/assets/searching.csv"), Charset.forName("UTF-8"));
			bufWriter.write("text,frequency");
			bufWriter.newLine();
			for (int i = 0; i < list.size(); i++) {

				bufWriter.write(list.get(i).getQueryValue());
				bufWriter.write(",");
				bufWriter.write(Integer.toString(list.get(i).getQuerycnt()*10));
				bufWriter.newLine();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (bufWriter != null) {
					bufWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("cnt1", list.get(0).getQueryValue());
		model.addAttribute("cnt2", list.get(1).getQueryValue());
		model.addAttribute("cnt3", list.get(2).getQueryValue());**/
		
		return "index";
	}

}
