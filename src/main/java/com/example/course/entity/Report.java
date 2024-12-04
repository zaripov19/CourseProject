package com.example.course.entity;

import com.example.course.BaseEntity;
import jakarta.persistence.Entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Report extends BaseEntity {

    private String title;
    private String description;
}
