package com.lol.banPick.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lol.banPick.command.BPCommand;
import com.lol.banPick.command.BPMatchCompleteCommand;
import com.lol.banPick.command.BPMatchMakeCommand;
import com.lol.banPick.command.BPMatchRecordCommand;
import com.lol.banPick.command.BPPlayerDeleteCommand;
import com.lol.banPick.command.BPPlayerInfoCommand;
import com.lol.banPick.command.BPPlayerModifyCommand;
import com.lol.banPick.command.BPPlayerRegisterCommand;
import com.lol.banPick.command.BPTeamListCommand;
import com.lol.banPick.command.BPTeamRegisterCommand;
import com.lol.banPick.constant.BPConstant;
import com.lol.banPick.dao.BPDao;
import com.lol.banPick.dto.lolChampionDto;

@Controller
public class BPController {
	private BPCommand com;
	private BPDao bpdao;
	@Autowired
	public void setBpdao(BPDao bpdao) {
		this.bpdao = bpdao;
		BPConstant.bpdao = bpdao;
	}
	
	@RequestMapping("/menuView")
	public String menuView() {
		System.out.println("menuView");
		return "menuView";
	}
	
	@RequestMapping("/teamInfoView")
	public String teamInfoView(HttpServletRequest request, Model model) {
		System.out.println("teamInfoView");
		com = new BPTeamListCommand();
		com.execute(request, model);
		return "teamInfoView";
	}
	
	@RequestMapping("/playerInfo")
	public String playerInfo(HttpServletRequest request, Model model) {
		System.out.println("teamInfoView");
		com = new BPPlayerInfoCommand();
		com.execute(request, model);
		return "playerInfo";
	}
	
	@RequestMapping("/banPickView")
	public String banPickView(HttpServletRequest request, Model model) {
		System.out.println("banPickView");
		lolChampionDto loldto = new lolChampionDto();
		String[] champions = loldto.getChampions();
		String[] championsEng = loldto.getChampionsEng();
		request.setAttribute("champions", champions);
		request.setAttribute("championsEng", championsEng);
		
		com = new BPMatchMakeCommand();
		com.execute(request, model);
		return "banPickView";
	}
	
	@RequestMapping("/teamRegisterView")
	public String teamRegisterView() {
		System.out.println("teamRegisterView");
		return "teamRegisterView";
	}
	
	@RequestMapping("/teamRegister")
	@ResponseBody
	public String teamRegister(HttpServletRequest request, Model model) {
		System.out.println("teamRegister");
		com = new BPTeamRegisterCommand();
		com.execute(request, model);
		String result = (String)request.getAttribute("result");
		return result;
	}
	
	@RequestMapping("/playerRegisterView")
	public String playerRegisterView(HttpServletRequest request, Model model) {
		System.out.println("playerRegisterView");
		com = new BPTeamListCommand();
		com.execute(request, model);
		return "playerRegisterView";
	}
	
	@RequestMapping("/playerRegister")
	@ResponseBody
	public String playerRegister(HttpServletRequest request, Model model) {
		System.out.println("playerRegister");
		com = new BPPlayerRegisterCommand();
		com.execute(request, model);
		String result = (String)request.getAttribute("result");
		return result;
	}
	
	@RequestMapping("/playerModify")
	@ResponseBody
	public String playerModify(HttpServletRequest request, Model model) {
		System.out.println("playerModify");
		com = new BPPlayerModifyCommand();
		com.execute(request, model);
		String result = (String)request.getAttribute("result");
		return result;
	}
	
	@RequestMapping("/playerDelete")
	@ResponseBody
	public String playerDelete(HttpServletRequest request, Model model) {
		System.out.println("playerDelete");
		com = new BPPlayerDeleteCommand();
		com.execute(request, model);
		String result = (String)request.getAttribute("result");
		return result;
	}
	
	@RequestMapping("/teamSelectView")
	public String teamSelectView(HttpServletRequest request, Model model) {
		System.out.println("teamSelectView");
		com = new BPTeamListCommand();
		com.execute(request, model);
		return "teamSelectView";
	}
	
	@RequestMapping("/playerList")
	public String playerList(HttpServletRequest request, Model model) {
		System.out.println("playerList");
		com = new BPPlayerInfoCommand();
		com.execute(request, model);
		String camp = request.getParameter("camp");
		if(camp.equals("blue")) {
			return "playerListBlue";
		} else {
			return "playerListRed";
		}
	}
	
	@RequestMapping("/matchComplete")
	public String matchComplete(HttpServletRequest request, Model model) {
		System.out.println("matchComplete");
		com = new BPMatchCompleteCommand();
		com.execute(request, model);
		return "menuView";
	}
	
	@RequestMapping("/matchRecordView")
	public String matchRecordView(HttpServletRequest request, Model model) {
		System.out.println("matchRecordView");
		com = new BPMatchRecordCommand();
		com.execute(request, model);
		return "matchRecordView";
	}
}
