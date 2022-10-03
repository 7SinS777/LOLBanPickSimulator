package com.lol.banPick.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lol.banPick.constant.BPConstant;
import com.lol.banPick.dao.BPDao;
import com.lol.banPick.dto.BanPickPhaseDto;
import com.lol.banPick.dto.MatchReatyDto;

public class BPMatchCompleteCommand implements BPCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		BPDao bpdao = BPConstant.bpdao;
		
		String[] camp = {"BLUE", "RED"};
		String[] position = {"TOP", "JGL", "MID", "ADC", "SPT"};
		ArrayList<String> blueAdd = new ArrayList<String>();
		ArrayList<String> redAdd = new ArrayList<String>();
		ArrayList<String> blueChampions = new ArrayList<String>();
		ArrayList<String> redChampions = new ArrayList<String>();
		String blueResult = null;
		String redResult = null;
		
		if(request.getParameter("winResult").equals("blueWin")) {
			blueResult = "WIN";
			redResult = "LOSE";
		} else {
			blueResult = "LOSE";
			redResult = "WIN";
		}
				
		String blueTeam = request.getParameter("blueTeam");
		String redTeam = request.getParameter("redTeam");
		
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
		
		String bluePick1 = request.getParameter("bluePick1");
		String bluePick2 = request.getParameter("bluePick2");
		String bluePick3 = request.getParameter("bluePick3");
		String bluePick4 = request.getParameter("bluePick4");
		String bluePick5 = request.getParameter("bluePick5");
		blueChampions = addDto(bluePick1, bluePick2, bluePick3, bluePick4, bluePick5);
		
		String redPick1 = request.getParameter("redPick1");
		String redPick2 = request.getParameter("redPick2");
		String redPick3 = request.getParameter("redPick3");
		String redPick4 = request.getParameter("redPick4");
		String redPick5 = request.getParameter("redPick5");
		redChampions = addDto(redPick1, redPick2, redPick3, redPick4, redPick5);
		
		int matchNo = bpdao.selectMatchNo()+1;
		String patchVersion = request.getParameter("patchVersion");
		
		ArrayList<MatchReatyDto> dtos = new ArrayList<MatchReatyDto>();
		dtos = addAllDtos(matchNo, camp, position, blueAdd, redAdd, blueChampions, redChampions, blueResult, redResult, blueTeam, redTeam, patchVersion);
		
		String[] banPick = request.getParameterValues("selectChampion[]");
		System.out.println(banPick.toString());
		BanPickPhaseDto bppdto = new BanPickPhaseDto(
				matchNo, banPick[0], banPick[1], banPick[2], banPick[3],
				banPick[4], banPick[5], banPick[6], banPick[7],
				banPick[8], banPick[9], banPick[10], banPick[11],
				banPick[12], banPick[13], banPick[14], banPick[15],
				banPick[16], banPick[17], banPick[18], banPick[19], patchVersion);
		
		bpdao.registerMatch(dtos);
		bpdao.registerBanPick(bppdto);
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
	
	private ArrayList<MatchReatyDto> addAllDtos(int matchNo, String[] camp, String[] position,
			ArrayList<String> blueAdd, ArrayList<String> redAdd, ArrayList<String> blueChampions,
			ArrayList<String> redChampions, String blueResult, String redResult, String blueTeam, String redTeam,
			String patchVersion) {
		ArrayList<MatchReatyDto> dtos = new ArrayList<MatchReatyDto>();
		for(int i=0; i<camp.length; i++) {
			if(camp[i].equals("BLUE")) {
				for(int j=0; j<position.length; j++) {
					MatchReatyDto dto = new MatchReatyDto(matchNo, camp[i], position[j], blueAdd.get(j), blueChampions.get(j), blueResult, patchVersion, blueTeam);
					System.out.println(dto.toString());
					dtos.add(dto);
				}
			} else if(camp[i].equals("RED")) {
				for(int j=0; j<position.length; j++) {
					MatchReatyDto dto = new MatchReatyDto(matchNo, camp[i], position[j], redAdd.get(j), redChampions.get(j), redResult, patchVersion, redTeam);
					System.out.println(dto.toString());
					dtos.add(dto);
				}
			}
		}
		return dtos;
	}
}