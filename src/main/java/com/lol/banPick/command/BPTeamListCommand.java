package com.lol.banPick.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lol.banPick.constant.BPConstant;
import com.lol.banPick.dao.BPDao;
import com.lol.banPick.dto.TeamListDto;

public class BPTeamListCommand implements BPCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		BPDao bpdao = BPConstant.bpdao;
		
		String searchType = request.getParameter("searchType");
		String search = request.getParameter("search");
		ArrayList<TeamListDto> dtos = new ArrayList<TeamListDto>();
		
		if(search == null || search == "") {
			dtos = bpdao.teamList();
		} else {
			dtos = bpdao.teamSearchList(searchType, search);
		}
		request.setAttribute("teamList", dtos);
		request.setAttribute("search", search);
	}
}
