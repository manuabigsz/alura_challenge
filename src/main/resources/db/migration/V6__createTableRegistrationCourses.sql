CREATE TABLE registration (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    course_id BIGINT NOT NULL,
    registration_date DATETIME NOT NULL,
    CONSTRAINT fk_registration_user FOREIGN KEY (user_id) REFERENCES user(id),
    CONSTRAINT fk_registration_course FOREIGN KEY (course_id) REFERENCES course(id),
    CONSTRAINT uk_registration_user_course UNIQUE (user_id, course_id)
);