package com.lol.banPick.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lol.banPick.constant.BPConstant;
import com.lol.banPick.dao.BPDao;

public class BPTeamRegisterCommand implements BPCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		BPDao bpdao = BPConstant.bpdao;
		
		String teamName = request.getParameter("teamName");
		String teamInitial = request.getParameter("teamInitial");
		String result = null;
		if(bpdao.checkTeamName(teamName)) {
			result = "register-failed because teamName is same";
		}
		if(bpdao.checkTeamInitial(teamInitial) && result == null) {
			result = "register-failed because teamInitial is same";
		}
		if(result == null) {
			result = bpdao.teamRegister(teamName, teamInitial);
		}
		request.setAttribute("result", result);
		
	}

}
