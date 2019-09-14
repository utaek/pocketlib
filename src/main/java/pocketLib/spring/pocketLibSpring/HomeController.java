package pocketLib.spring.pocketLibSpring;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pocketLib.spring.pocketLibSpring.mybatis.model.Customer;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

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


		List<String[]> tmpList = new ArrayList<String[]>();
		BufferedReader br = null;

		try {
			br = Files.newBufferedReader(Paths.get("C:/JangHo_park/workspace-jsp/pocketlib/src/main/webapp/WEB-INF/views/assets/searching.csv"));
			Charset.forName("UTF-8");
			String line = "";
			while ((line = br.readLine()) != null) {
				// CSV 1행을 저장하는 리스트
				String[] array = line.split(",");
				// 배열에서 리스트 반환
				tmpList.add(array);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (br != null) {
					br.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		String[] rank1 = tmpList.get(1);
		String[] rank2 = tmpList.get(2);
		String[] rank3 = tmpList.get(3);
 		model.addAttribute("rank1",rank1[0] );
		model.addAttribute("rank2", rank2[0]);
		model.addAttribute("rank3", rank3[0]);

		return "index";
	}

}
