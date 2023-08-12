
package modelo;


public class Asignatura {
    private String nivel_educativo;
    private String asignatura;
    private int id_profesor;
    private int id_asignatura;
    public Asignatura() {
    }

    public String getNivel_educativo() {
        return nivel_educativo;
    }

    public void setNivel_educativo(String nivel_educativo) {
        this.nivel_educativo = nivel_educativo;
    }

    public String getAsignatura() {
        return asignatura;
    }

    public void setAsignatura(String asignatura) {
        this.asignatura = asignatura;
    }

    public int getId_profesor() {
        return id_profesor;
    }

    public void setId_profesor(int id_profesor) {
        this.id_profesor = id_profesor;
    }
    public void setId_asignatura(int id_asignatura){
        this.id_asignatura=id_asignatura;
    }
    public int getId_asignatura(){
        return id_asignatura;
    }
}
