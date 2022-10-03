package com.lol.banPick.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lol.banPick.constant.BPConstant;
import com.lol.banPick.dao.BPDao;
import com.lol.banPick.dto.PlayerListDto;
import com.lol.banPick.dto.TeamListDto;

public class BPPlayerInfoCommand implements BPCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		BPDao bpdao = BPConstant.bpdao;
		
		String teamName = request.getParameter("teamName");
		String teamInitial = request.getParameter("teamInitial");
		
		ArrayList<PlayerListDto> dtos = bpdao.playerInfo(teamInitial);
		
		ArrayList<String> top = checkPosition(dtos, "TOP");
		ArrayList<String> jgl = checkPosition(dtos, "JGL");
		ArrayList<String> mid = checkPosition(dtos, "MID");
		ArrayList<String> adc = checkPosition(dtos, "ADC");
		ArrayList<String> spt = checkPosition(dtos, "SPT");
		
		request.setAttribute("teamName", teamName);
		request.setAttribute("teamInitial", teamInitial);
		
		request.setAttribute("top", top);
		request.setAttribute("jgl", jgl);
		request.setAttribute("mid", mid);
		request.setAttribute("adc", adc);
		request.setAttribute("spt", spt);
		
		ArrayList<TeamListDto> teamDtos = bpdao.teamList();
		
		request.setAttribute("teamList", teamDtos);
	}

	public ArrayList<String> checkPosition(ArrayList<PlayerListDto> dtos, String position) {
		ArrayList<String> players = new ArrayList<String>();
		for(int i=0; i<dtos.size(); i++) {
			if(dtos.get(i).getPosition().equals(position)) {
				players.add(dtos.get(i).getNickName());
			}
		}
		return players;
	}

}
