package com.fashion_store.dao;

import com.fashion_store.model.User;

public interface UserDAO {

    User getUserById(int userId);

    User getUserByEmail(String email);

    boolean registerUser(User user);

    boolean updateUser(User user);
}