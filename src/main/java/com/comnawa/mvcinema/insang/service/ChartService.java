package com.comnawa.mvcinema.insang.service;

import java.util.Map;

import org.json.simple.JSONObject;

public interface ChartService {
  public JSONObject getChartData(String select);
  public JSONObject getSearchDetail(String member, int age, int movie);
  public Map<String, Object> getSales(int s_year, int s_month, int e_year, int e_month);
}
