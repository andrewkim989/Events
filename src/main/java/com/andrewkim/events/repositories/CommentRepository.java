package com.andrewkim.events.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.andrewkim.events.models.Comment;

@Repository
public interface CommentRepository extends CrudRepository <Comment, Long> {
	List <Comment> findAll();
}
