package org.gxuwz.course_log.model.entity;

import org.springframework.stereotype.Component;

@Component
public class User {
    private String userId;
    private String userName;
    private String userPwd;
    private String userPhone;

    public User(String userId, String userName, String userPwd, String userPhone) {
        this.userId = userId;
        this.userName = userName;
        this.userPwd = userPwd;
        this.userPhone = userPhone;
    }

    public User() {
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId='" + userId + '\'' +
                ", userName='" + userName + '\'' +
                ", userPwd='" + userPwd + '\'' +
                ", userPhone='" + userPhone + '\'' +
                '}';
    }
}
