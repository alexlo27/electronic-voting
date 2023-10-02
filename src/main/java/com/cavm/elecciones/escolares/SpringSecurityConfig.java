package com.cavm.elecciones.escolares;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.servlet.util.matcher.MvcRequestMatcher;
import org.springframework.web.servlet.handler.HandlerMappingIntrospector;

@Configuration
@EnableWebSecurity
public class SpringSecurityConfig {
	@Bean
	public UserDetailsService userDetailsService()throws Exception{
				
		InMemoryUserDetailsManager manager = new InMemoryUserDetailsManager();
		manager.createUser(User
	            .withUsername("user")
	            .password(passwordEncoder().encode("user"))
	            .roles("USER")
	            .build());
		 manager.createUser(User
		            .withUsername("admin")
		            .password(passwordEncoder().encode("admin"))
		            .roles("ADMIN","USER")
		            .build());
		
		return manager;
		/*UserDetails user =
				 User.withDefaultPasswordEncoder()
					.username("user")
					.password("password")
					.roles("USER")
					.build();

			return new InMemoryUserDetailsManager(user);*/

	}
	
	@Bean 
	public static BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http
		.authorizeHttpRequests((requests) -> requests
			.requestMatchers("/", "/role","/img/**","/css/**","/js/**","/uploads/**").permitAll()
			.requestMatchers("/institution").hasRole("ADMIN")
			.anyRequest().authenticated()
		)
		.formLogin((form) -> form
			//.loginPage("/login")
			.permitAll()
		)
		.logout((logout) -> logout.permitAll());

	return http.build();
            
    }
    
}
