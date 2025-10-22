package br.com.alura.projeto.registration;

public interface RegistrationReportProjection {
    String getCourseName();
    String getCourseCode();
    String getInstructorName();
    String getInstructorEmail();
    Long getTotalRegistrations();
}