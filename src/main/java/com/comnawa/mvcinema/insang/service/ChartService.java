package com.comnawa.mvcinema.insang.service;

import org.json.simple.JSONObject;

public interface ChartService {
  public JSONObject getChartData(String member, String age, String movie);
}
