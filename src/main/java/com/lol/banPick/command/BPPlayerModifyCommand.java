package com.lol.banPick.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lol.banPick.constant.BPConstant;
import com.lol.banPick.dao.BPDao;
import com.lol.banPick.dto.PlayerListDto;

public class BPPlayerModifyCommand implements BPCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		BPDao bpdao = BPConstant.bpdao;
		
		String selectTeamInitial = request.getParameter("selectTeamInitial");
		String[] player = request.getParameterValues("player");
		String[] teamInitial = request.getParameterValues("teamInitial");
		String[] position = request.getParameterValues("position");
		String result = null;
		
		for(int i=0; i<player.length; i++) {
			if(bpdao.checkModify(new PlayerListDto(player[i], teamInitial[i], position[i]))) {
				break;
			}
			if(i==player.length-1) {
				result = "modify-failed no change";
			}
		}
		
		if(bpdao.checkPlayer(player, selectTeamInitial) && result == null) {
			result = "modify-failed same nickName";
		}
		
		if(result == null) {
			bpdao.deletePlayer(selectTeamInitial);
			for(int i=0; i<player.length; i++) {
				bpdao.playerRegister(new PlayerListDto(player[i], teamInitial[i], position[i]));
			}
			result = "modify-success";
		}
		System.out.println(result);
		request.setAttribute("result", result);
	}

}
