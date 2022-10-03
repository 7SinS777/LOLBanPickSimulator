package com.lol.banPick.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lol.banPick.constant.BPConstant;
import com.lol.banPick.dao.BPDao;
import com.lol.banPick.dto.BanPickPhaseDto;
import com.lol.banPick.dto.MatchReatyDto;

public class BPMatchRecordCommand implements BPCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		BPDao bpdao = BPConstant.bpdao;
		
		ArrayList<BanPickPhaseDto> bppdto = bpdao.getBanPickRecord();
		
		request.setAttribute("recordList", bppdto);
		
		//ArrayList<Integer> matchNos = addAllNos(bppdto);
		
		ArrayList<MatchReatyDto> mrdto = bpdao.getMatchRecord();
		
		request.setAttribute("matchList", mrdto);
		
		ArrayList<String> patchList = bpdao.getPatchVersion();
		
		request.setAttribute("patchVersions", patchList);
	}

	/*
	private ArrayList<Integer> addAllNos(ArrayList<BanPickPhaseDto> bppdto) {
		ArrayList<Integer> nos = new ArrayList<Integer>();
		for(int i=0; i<bppdto.size(); i++) {
			nos.add(bppdto.get(i).getMatchNo());
		}
		return nos;
	}
	*/
}