package com.xmut.utils;

public class Pagination {
    int start = 0;//起始数据位置
    int count = 5;//每页展示的数据个数
    int last = 0;//最后一页的位置
    String dcDepartment;//查询字符型参数
    int sum;//查询数值型参数
    Boolean flay = true;//分页判断

    public String getDcDepartment() {
        return dcDepartment;
    }

    public void setDcDepartment(String dcDepartment) {
        this.dcDepartment = dcDepartment;
    }

    public int getSum() {
        return sum;
    }

    public void setSum(int sum) {
        this.sum = sum;
    }

    public int page() {
        return start;
    }
    public int getStart() {
        return start;
    }
    public void setStart(int start) {
        this.start = start;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getLast() {
        return last;
    }

    public void setLast(int last) {
        this.last = last;
    }
    
    public Boolean getFlay() {
		return flay;
	}
	public void setFlay(Boolean flay) {
		this.flay = flay;
	}
	public void caculateLast(int total){
        if(0 == total % count){
            last = total - count;
        }else{
            last = total - total % count;
        }
    }
}