package pocketLib.spring.pocketLibSpring.scheduler;

import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import pocketLib.spring.pocketLibSpring.mybatis.model.Searching;
import pocketLib.spring.pocketLibSpring.mybatis.service.SearchingService;

@Controller
public class CsvScheduler {
	
	@Autowired
	SearchingService searchingservice;
	
	public void getCsv() {
		List<Searching> searchingList = null;
		try {
			searchingList = searchingservice.CSVList(null);
		} catch (Exception e) {
			e.getStackTrace();
		}

		ArrayList<Searching> list = (ArrayList<Searching>) searchingList;

		BufferedWriter bufWriter = null;
		try {
			bufWriter = Files.newBufferedWriter(Paths.get("../pocketlib/src/main/webapp/WEB-INF/views/assets/searching.csv"), Charset.forName("UTF-8"));
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
	}
}
