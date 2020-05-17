package org.gxuwz.course_log.service;

import org.gxuwz.course_log.model.entity.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

public interface UserService {

    User loginUser(String userId, String userPwd);

}
