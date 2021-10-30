import java.util.ArrayList;

public class Serie extends ItemAgrupado{
    public int temporadas;


    public Serie(String titulo, String genero, String diretor,int temp) {
        super(titulo, genero, diretor);
        this.temporadas = temp;
    }


    public int getTemporadas() {
        return temporadas;
    }

    public void setTemporadas(int temporadas) {
        this.temporadas = temporadas;
    }

    @Override
    public void imprimir() {

        int i = 1;
        int duracaoTotal = 0;
        System.out.println(getTitulo());
        for (Filme filme: getFilmes()) {
            System.out.println("  " +  i + ". " + filme.getTitulo() + " (" + filme.getGenero() + ") - " + filme.getDuracao() + " min");
            i ++;
            duracaoTotal+=filme.getDuracao();
        }
        System.out.println("Numero de temporadas: " + getTemporadas());
        System.out.println("Duracao total: " + duracaoTotal +" min" + "\n");
    }



}