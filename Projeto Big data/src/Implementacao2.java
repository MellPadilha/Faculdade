// package com.aap.bigdata;
//Descomenta a linha um e verifica se os imports estão corretos
import java.io.IOException;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;


public class Implementacao2{
  
  public static class MapperImplementacao2 extends Mapper<Object, Text, Text, IntWritable>{
    
    @Override
    public void map(Object chave, Text valor, Context context) throws IOException, InterruptedException{
      String linha = valor.toString();
      String[] campos = linha.split(";"); //Tirar o regex
      if(campos.length == 9 && campos[4].equals("MOTOR VEHICLE THEFT") && Integer.valueOf(campos[0]) % 2 == 1){

        String mes = campos[1];
        String ano = campos[2];
        String chaves = ano + "/" + mes;
        int ocorrencia = 1;

        Text chaveHadoop = new Text(chaves);
        IntWritable valorMap = new IntWritable(ocorrencia);

        context.write(chaveMap, valorMap);
      }
    }
  }
  public static class ReducerImplementacao2 extends Reducer<Text, IntWritable, Text, IntWritable>{
    
    @Override
    public void reduce(Text chave, Iterable<IntWritable> valores, Context context) throws IOException, InterruptedException{
      int soma = 0;
      for (IntWritable val : valores){
        soma += val.get();
      }
      IntWritable valorSaida = new IntWritable(soma);
      context.write(chave, valorSaida);
    }
  }

  public static void main(String[] args) {

    String arquivoEntrada = // coloca aqui o local que ta o arquivo tipo "/home/Pasta/Ocorrenciascriminas...."
    String arquivoSaida = // coloca aqui o local tu quer que vá o resultadp "/home/pasta de saida

    if(args.length == 2){
      arquivoEntrada = args[0];
      arquivoSaida = args[0];
    }

    Configuration conf = new Configuration();
    Job job = Job.getInstance(conf, "atividade2");

    job.setJarByClass(Implementacao2.class);
    job.setJarByClass(MapperImplementacao2.class);
    job.setReducerClass(ReducerImplementacao2.class);
    job.setOutputKeyClass(Text.class);
    job.setOutputValueClass(IntWritable.class);

    FileInputFormat.addInputPath(job, new Path(arquivoEntrada));
    FileOutputFormat.setOutputPath(job, new Path(arquivoSaida));

    job.waitForCompletion(true);

  }
}
