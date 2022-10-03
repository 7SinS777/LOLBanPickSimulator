package com.lol.banPick.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface BPCommand {
	public void execute(HttpServletRequest request, Model model);
}
