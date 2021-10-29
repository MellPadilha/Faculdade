import java.io.File;
import java.util.ArrayList;

public class ItemAgrupado extends Item {
    private Filme filme;
    private ArrayList<Filme> filmes = new ArrayList<>();

    public ItemAgrupado(String titulo, String genero, String diretor) {
        super(titulo, genero, diretor);

    }
    public ArrayList<Filme> getFilmes() {
        return filmes;
    }

    public void adicionar(Filme filme) {
        this.filmes.add(filme);

    }
    public int getDuracao(){
        return this.filme.getDuracao();
    }

    @Override
    public void imprimir() {

    }
}