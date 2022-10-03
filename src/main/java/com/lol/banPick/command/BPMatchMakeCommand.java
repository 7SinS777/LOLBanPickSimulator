package com.lol.banPick.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lol.banPick.constant.BPConstant;
import com.lol.banPick.dao.BPDao;
import com.lol.banPick.dto.MatchReatyDto;

public class BPMatchMakeCommand implements BPCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		BPDao bpdao = BPConstant.bpdao;
		
		String[] camp = {"BLUE", "RED"};
		String[] position = {"TOP", "JGL", "MID", "ADC", "SPT"};
		ArrayList<String> blueAdd = new ArrayList<String>();
		ArrayList<String> redAdd = new ArrayList<String>();
		
		String blueTeam = request.getParameter("blue");
		String redTeam = request.getParameter("red");
		
		String blueTOP = request.getParameter("blueTOP");
		String blueJGL = request.getParameter("blueJGL");
		String blueMID = request.getParameter("blueMID");
		String blueADC = request.getParameter("blueADC");
		String blueSPT = request.getParameter("blueSPT");
		blueAdd = addDto(blueTOP, blueJGL, blueMID, blueADC, blueSPT);
		
		String redTOP = request.getParameter("redTOP");
		String redJGL = request.getParameter("redJGL");
		String redMID = request.getParameter("redMID");
		String redADC = request.getParameter("redADC");
		String redSPT = request.getParameter("redSPT");
		redAdd = addDto(redTOP, redJGL, redMID, redADC, redSPT);
		
		ArrayList<MatchReatyDto> dtos = new ArrayList<MatchReatyDto>();
		String patchVersion = request.getParameter("patchVersion");
		int matchNo = bpdao.selectMatchNo()+1;
		dtos = addAllDtos(matchNo, camp, position, blueAdd, redAdd, blueTeam, redTeam, patchVersion);
		
		//bpdao.registerMatch(dtos);
		
		request.setAttribute("blueTeam", blueTeam);
		request.setAttribute("redTeam", redTeam);
		request.setAttribute("patchVersion", patchVersion);
		request.setAttribute("matchInfo", dtos);
		request.setAttribute("matchNo", matchNo);
	}
	
	private ArrayList<String> addDto(String TOP, String JGL, String MID, String ADC, String SPT) {
		ArrayList<String> stringDto = new ArrayList<String>();
		stringDto.add(TOP);
		stringDto.add(JGL);
		stringDto.add(MID);
		stringDto.add(ADC);
		stringDto.add(SPT);
		return stringDto;
	}
	private ArrayList<MatchReatyDto> addAllDtos(int matchNo, String[] camp, String[] position, ArrayList<String> blueAdd,
			ArrayList<String> redAdd, String blueTeam, String redTeam, String patchVersion) {
		ArrayList<MatchReatyDto> dtos = new ArrayList<MatchReatyDto>();
		for(int i=0; i<camp.length; i++) {
			if(camp[i].equals("BLUE")) {
				for(int j=0; j<position.length; j++) {
					MatchReatyDto dto = new MatchReatyDto(matchNo, camp[i], position[j], blueAdd.get(j), patchVersion, blueTeam);
					dtos.add(dto);
				}
			} else if(camp[i].equals("RED")) {
				for(int j=0; j<position.length; j++) {
					MatchReatyDto dto = new MatchReatyDto(matchNo, camp[i], position[j], redAdd.get(j), patchVersion, redTeam);
					dtos.add(dto);
				}
			}
		}
		return dtos;
	}
}