package com.example.course.entity;

import com.example.course.BaseEntity;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Students extends BaseEntity {


    private String name;

    private Integer pay;

    @ManyToOne
    private Groups group;

}
