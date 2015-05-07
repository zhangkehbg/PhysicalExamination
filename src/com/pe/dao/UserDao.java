package com.pe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.pe.entity.Users;
import com.pe.util.DBUtil;

public class UserDao {
	private static Connection conn = null;
	private static PreparedStatement ps = null;
	private static ResultSet rs = null;

	public static List<Users> findAll() throws Exception {
		List<Users> list = new ArrayList<Users>();
		conn = DBUtil.getConnection();
		String sql = "select * from Users ";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next()) {
			String id = rs.getString("id");
			String name = rs.getString("name");
			String pwd = rs.getString("password");
			String position = rs.getString("position");
			String permission = rs.getString("permission");
			Users user = new Users(id, name, pwd, position, permission);
			list.add(user);

		}
		return list;
	}

	public static Users findByName(String id1) throws Exception {
		if (!DBUtil.isHaveTable("combo")) {
			DBUtil.initComboDb();
		}
		if (!DBUtil.isHaveTable("examination_project")) {
			DBUtil.initExaminationProject();
		}
		if (!DBUtil.isHaveTable("office")) {
			DBUtil.initOffice();
		}
		if (!DBUtil.isHaveTable("reservation")) {
			DBUtil.initReservation();
		}
		if (!DBUtil.isHaveTable("registration")) {
			DBUtil.initRegistration();
		}

		Users users = null;
		conn = DBUtil.getConnection();
		String sql = "select * from Users where id='" + id1 + "'";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next()) {
			String id = rs.getString("id");
			String username = rs.getString("name");
			String password = rs.getString("password");
			String position = rs.getString("position");
			String permission = rs.getString("permission");
			users = new Users(id, username, password, position, permission);
		}
		return users;
	}

	public static String sign_in(String username, String password, String position) {
		String employeeCode = generateEmployeeCode(position);
		try {
			conn = DBUtil.getConnection();
			String sql = "insert into Users(id,name,password,position) values(?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1,employeeCode);
			ps.setString(2,username);
			ps.setString(3,password);
			ps.setString(4,position);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return employeeCode;

		// return null;
	}

	private static String generateEmployeeCode(String position) {
		Calendar cal = Calendar.getInstance();
		String year = String.valueOf(cal.get(Calendar.YEAR));//获取年份
		String month=String.valueOf(cal.get(Calendar.MONTH));//获取月份
		String positionCode = null;
		String count = null;
		switch (position) {
		case "doctor":
			positionCode = "YS";
			break;
		case "manage":
			positionCode = "LD";
			break;
		case "receptionist":
			positionCode = "QT";
			break;
		default:
			break;
		}
		try {
			conn = DBUtil.getConnection();
			String sql = "select count(*) as cc from Users";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			count = String.valueOf(rs.getInt(1)+1);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return positionCode + year + month + count;
	// TODO Auto-generated method stub
	
}

	public static void modifyEmployee(int id, String name, String position) {
		// TODO Auto-generated method stub
		try {
			conn = DBUtil.getConnection();
			String sql = "update Users set name=?,position=? where id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(3, id);
			ps.setString(1, name);
			ps.setString(2, position);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void deleteEmployee(int id) {
		// TODO Auto-generated method stub
		try {
			conn = DBUtil.getConnection();
			String sql = "delete from Users where id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void setPermission(String id, String permission) {
		// TODO Auto-generated method stub
		try {
			conn = DBUtil.getConnection();
			String sql = "update Users set permission=? where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(2, id);
			ps.setString(1, permission);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
