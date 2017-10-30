//package com.config;
//
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//
//@Configuration
//@EnableWebSecurity
//public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
//
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//
////        http.authorizeRequests().anyRequest().authenticated();
////        http.formLogin().failureUrl("/login?error")
////                .defaultSuccessUrl("/")
////                .loginPage("/login")
////                .permitAll()
////                .and()
////                .logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout")).logoutSuccessUrl("/login")
////                .permitAll();
//
//
////                .antMatchers("/", "/home", "/about").permitAll()
////                .antMatchers("/admin/**").hasAnyRole("ADMIN")
////                .antMatchers("/user/**").hasAnyRole("USER")
////                .anyRequest().authenticated()
////                .and().csrf().disable()
////                .formLogin()
////                .loginPage("/login").permitAll()
////                .and()
////                .logout()
////                .permitAll()
////                .and()
////                .exceptionHandling().accessDeniedHandler(accessDeniedHandler);
//
//
//        http.authorizeRequests()
//                .antMatchers("/buyers").access("hasRole('ADMIN')")
//                .antMatchers("/buyers").access("hasRole('USER')")
//                .anyRequest().permitAll()
//                .and()
//                .formLogin().loginPage("/login")
//                .usernameParameter("email").passwordParameter("password")
//                .and()
//                .logout().logoutSuccessUrl("/login?logout")
//                .and()
//                .exceptionHandling().accessDeniedPage("/403")
//                .and()
//                .csrf();
//    }
////раскоментить если AuthenticationService не работает
////    @Override
////    public void configure(AuthenticationManagerBuilder auth) throws Exception {
////        auth.jdbcAuthentication()
////                .usersByUsernameQuery(
////                        "select email,password, enabled from buyers where email=?")
////                .authoritiesByUsernameQuery(
////                        "select email, role from buyers where email=?");
////
////    }
//
//
//
//}
