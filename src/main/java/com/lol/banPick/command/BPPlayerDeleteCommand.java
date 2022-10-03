package com.lol.banPick.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lol.banPick.constant.BPConstant;
import com.lol.banPick.dao.BPDao;

public class BPPlayerDeleteCommand implements BPCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		BPDao bpdao = BPConstant.bpdao;
		
		String[] player = request.getParameterValues("player[]");
		
		String result = null;
		
		for(int i=0; i<player.length; i++) {
			result = bpdao.playerDelete(player[i]);
		}
		
		request.setAttribute("result", result);
	}

}
