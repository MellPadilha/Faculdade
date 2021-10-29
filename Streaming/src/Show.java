

public class Show extends ItemAgrupado{


    public Show(String titulo, String genero, String diretor) {
        super(titulo, genero, diretor);
    }

    public void imprimir() {

        int i = 1;
        int duracaoTotal = 0;
        System.out.println(getTitulo());
        for (Filme filme : getFilmes()) {
            System.out.println("  " + i + ". " + filme.getTitulo() + ", (" + filme.getGenero() + ")"  + " - " + filme.getDuracao() + " min");
            i++;
            duracaoTotal+=filme.getDuracao();
        }
        System.out.println("Duracao total: " + duracaoTotal +" min" + "\n");
    }
}

