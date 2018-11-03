package com.andrewkim.events.validator;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.andrewkim.events.models.User;
import com.andrewkim.events.repositories.UserRepository;

@Component
public class EventValidator implements Validator {
	private final UserRepository userRepository;
	
	public EventValidator (UserRepository userRepository) {
        this.userRepository = userRepository;
    }
	@Override
    public boolean supports (Class<?> clazz) {
        return User.class.equals(clazz);
    }
    
    @Override
    public void validate (Object target, Errors errors) {
        User user = (User) target;
        List <User> allusers = userRepository.findAll();
        
        if (!user.getPasswordConfirmation().equals(user.getPassword())) {
            errors.rejectValue("passwordConfirmation", "PasswordConfirm");
        }
        for (int i = 0; i < allusers.size(); i++) {
        	String email = allusers.get(i).getEmail();
        	if (email.equals(user.getEmail())) {
        		errors.rejectValue("email", "EmailIsAlreadyThere");
        	}
        }
    }
}
