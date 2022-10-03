package com.lol.banPick.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lol.banPick.constant.BPConstant;
import com.lol.banPick.dao.BPDao;
import com.lol.banPick.dto.PlayerListDto;

public class BPPlayerRegisterCommand implements BPCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		BPDao bpdao = BPConstant.bpdao;
		
		String[] player = request.getParameterValues("player");
		String[] teamInitial = request.getParameterValues("teamInitial");
		String[] position = request.getParameterValues("position");
		String result = null;
		
		if(bpdao.checkPlayer(player)) {
			result = "register-failed same nickName";
		} else {
			for(int i=0; i<player.length; i++) {
				bpdao.playerRegister(new PlayerListDto(player[i], teamInitial[i], position[i]));
			}
			result = "register-success";
		}
		
		request.setAttribute("result", result);
	}

}