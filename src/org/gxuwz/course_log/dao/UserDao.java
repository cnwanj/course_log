package org.gxuwz.course_log.dao;

import org.gxuwz.course_log.model.entity.User;

public interface UserDao {

    User loginUser(String userId, String userPwd);

}
