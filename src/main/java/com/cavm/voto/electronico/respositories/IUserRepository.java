package com.cavm.voto.electronico.respositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.cavm.voto.electronico.models.User;

public interface IUserRepository extends CrudRepository<User, Long>{
	
	@Query("SELECT u FROM User u WHERE username=:username AND password=:password")
	User validateUser(@Param("username") String username, @Param("password") String password);
	
	public User findByUsername(String username);
}
