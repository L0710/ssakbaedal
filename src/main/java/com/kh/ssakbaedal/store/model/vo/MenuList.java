package com.kh.ssakbaedal.store.model.vo;

import java.util.List;

public class MenuList {
	 private List<Menu> menuList;
	 
	 public MenuList() {}



	public MenuList(List<Menu> menuList) {
		super();
		this.menuList = menuList;
	}



	public List<Menu> getMenuList() {
		return menuList;
	}



	public void setMenuList(List<Menu> menuList) {
		this.menuList = menuList;
	}



	@Override
	public String toString() {
		return "MenuList [menuList=" + menuList + "]";
	}

}
