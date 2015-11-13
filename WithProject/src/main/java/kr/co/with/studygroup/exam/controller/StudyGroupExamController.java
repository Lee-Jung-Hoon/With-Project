package kr.co.with.studygroup.exam.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.with.studygroup.exam.service.StudyGroupExamService;
import kr.co.with.studygroup.exam.vo.StudyGroupExamVO;
import kr.co.with.studygroup.exam.vo.StudyGroupExampleItemVO;
import kr.co.with.studygroup.exam.vo.StudyGroupExampleSendItemVO;
import kr.co.with.studygroup.exam.vo.StudyGroupExampleVO;

@Controller
@RequestMapping("/exam")
public class StudyGroupExamController {
	
	@Autowired
	private StudyGroupExamService service;

	// 시험 만들기 폼 테스트
	@RequestMapping("/examList.do")
	public ModelAndView ExamList() throws Exception {
		ModelAndView mav = new ModelAndView("examList");
		List<StudyGroupExamVO> list = service.selectExamList(1);
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("/createExam.do")
	public String CreateExam(String examTitle, String examExplain, String exampleTitle, String example_answer) throws Exception {
		StudyGroupExamVO exam = new StudyGroupExamVO();
		// 시험 제목
		exam.setExamTitle(examTitle);
		// 시험 설명
		exam.setExamInfo(examExplain);

		// 시험 정보 및 제목을 DB에 입력
		int ExamNo = service.insertExamInfo(exam);
		
		String exampleTitles[] = exampleTitle.split(",");
		String example_answers[] = example_answer.split(",");
		for(int i=0; i<exampleTitles.length; i++) {
			StudyGroupExampleVO example = new StudyGroupExampleVO();
			example.setExampleTitle(exampleTitles[i]);
			example.setExamNo(ExamNo);

			// 시험 문제를 DB에 입력
			int ExampleNo = service.insertExample(example);
			String[] answers = example_answers[i].split("-");
			for(int j=0; j<answers.length; j++) {
				String[] example_correct = answers[j].split(":");
				StudyGroupExampleItemVO item = new StudyGroupExampleItemVO();
				item.setExamNo(ExamNo);
				item.setExampleNo(ExampleNo);
				item.setItemTitle(example_correct[0]);
				item.setItemCorrect(example_correct[1]);
				service.insertExmpleItem(item);
			}
		}
		return "redirect:/exam/examList.do";
	}
	
	@RequestMapping("/examResolve.do")
	public ModelAndView ExamList(int no, String info, String title) throws Exception {
		ModelAndView mav = new ModelAndView("examResolve");
		List<StudyGroupExampleVO> list = service.selectExampleList(no);
		mav.addObject("info", info);
		mav.addObject("title", title);
		mav.addObject("list", list);
		List<String> sendItemList = new ArrayList<String>();
		for(int i=0; i<list.size(); i++) {
			String sendItem = "";
			List<StudyGroupExampleItemVO> items = service.selectExampleItemList(list.get(i).getExampleNo());
			for(int j=0; j<items.size(); j++) {
				if(j==items.size()-1) 
					sendItem += (items.get(j).getItemTitle()+":"+items.get(j).getItemCorrect());
				else 
					sendItem += items.get(j).getItemTitle()+":"+items.get(j).getItemCorrect()+",";
			}
			sendItemList.add(sendItem);
		}
		mav.addObject("item", sendItemList);
		return mav;
	}
}
