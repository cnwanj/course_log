package org.gxuwz.course_log.service.impl;

import org.gxuwz.course_log.dao.UserDao;
import org.gxuwz.course_log.model.entity.User;
import org.gxuwz.course_log.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    public User loginUser(String userId, String userPwd) {
        return userDao.loginUser(userId, userPwd);
    }
}
