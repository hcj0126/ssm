package com.hcj.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Product {

    /**
     * 主键
    */
    private String id;
    /**
     * 编号 唯一
     */
    private String productNum;
    /**
     * 产品名称
     */
    private String productName;
    /**
     *  出发城市
     */
    private String cityName;

    /**
     * 时间数据到页面显示成功
     * 页面中的字符串时间可以转换成Date类型，形成自动参数绑定
     */
    /*@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")*/
    private Date departureTime; // 出发时间

    /**
     * 产品价格
     */
    private double productPrice;
    /**
     * 产品描述
     */
    private String productDesc;

    /**
     * 状态 0 关闭 1 开启
     */
    private Integer productStatus;
    /**
     *  据库没有的字段，用于页面显示 (非数据库表product中的字段)
     */
    private String productStatusStr;
    /**
     * 数据库没有的字段，用于页面显示 (非数据库表product中的字段)
     */
    //@TableField(exist = false)
    private String departureTimeStr;

    private String conditions;

    public String getConditions() {
        return conditions;
    }

    public void setConditions(String conditions) {
        this.conditions = conditions;
    }

    public Product() {
    }

    public Product(String id, String productNum, String productName, String cityName, Date departureTime, String departureTimeStr, double productPrice, String productDesc, Integer productStatus, String productStatusStr) {
        this.id = id;
        this.productNum = productNum;
        this.productName = productName;
        this.cityName = cityName;
        this.departureTime = departureTime;
        this.departureTimeStr = departureTimeStr;
        this.productPrice = productPrice;
        this.productDesc = productDesc;
        this.productStatus = productStatus;
        this.productStatusStr = productStatusStr;
    }

    /**
     * 获取
     * @return id
     */
    public String getId() {
        return id;
    }

    /**
     * 设置
     * @param id
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 获取
     * @return productNum
     */
    public String getProductNum() {
        return productNum;
    }

    /**
     * 设置
     * @param productNum
     */
    public void setProductNum(String productNum) {
        this.productNum = productNum;
    }

    /**
     * 获取
     * @return productName
     */
    public String getProductName() {
        return productName;
    }

    /**
     * 设置
     * @param productName
     */
    public void setProductName(String productName) {
        this.productName = productName;
    }

    /**
     * 获取
     * @return cityName
     */
    public String getCityName() {
        return cityName;
    }

    /**
     * 设置
     * @param cityName
     */
    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    /**
     * 获取
     * @return departureTime
     */
    public Date getDepartureTime() {
        return departureTime;
    }

    /**
     * 设置
     * @param departureTime
     */
    public void setDepartureTime(Date departureTime) {
        this.departureTime = departureTime;
    }

    /**
     * 获取
     * @return departureTimeStr
     */
    public String getDepartureTimeStr() {
        return departureTimeStr;
    }

    /**
     * 设置
     * @param departureTimeStr
     */
    public void setDepartureTimeStr(String departureTimeStr) {
        this.departureTimeStr = departureTimeStr;
    }

    /**
     * 获取
     * @return productPrice
     */
    public double getProductPrice() {
        return productPrice;
    }

    /**
     * 设置
     * @param productPrice
     */
    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    /**
     * 获取
     * @return productDesc
     */
    public String getProductDesc() {
        return productDesc;
    }

    /**
     * 设置
     * @param productDesc
     */
    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    /**
     * 获取
     * @return productStatus
     */
    public Integer getProductStatus() {
        return productStatus;
    }

    /**
     * 设置
     * @param productStatus
     */
    public void setProductStatus(Integer productStatus) {
        this.productStatus = productStatus;
    }

    /**
     * 获取
     * @return productStatusStr
     */
    public String getProductStatusStr() {
        if(productStatus==0){
            productStatusStr = "关闭";
        }else if(productStatus==1){
            productStatusStr = "开启";
        }
        return productStatusStr;
    }

    /**
     * 设置
     * @param productStatusStr
     */
    public void setProductStatusStr(String productStatusStr) {
        this.productStatusStr = productStatusStr;
    }

    @Override
    public String toString() {
        return "Product{id = " + id + ", productNum = " + productNum + ", productName = " + productName + ", cityName = " + cityName + ", departureTime = " + departureTime + ", departureTimeStr = " + departureTimeStr + ", productPrice = " + productPrice + ", productDesc = " + productDesc + ", productStatus = " + productStatus + ", productStatusStr = " + productStatusStr + "}";
    }
}
