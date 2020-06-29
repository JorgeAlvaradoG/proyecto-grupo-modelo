/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import conexionbd.Conexion;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.itextpdf.text.*;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.*;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;

/**
 *
 * @author johnc
 */
public class Reportes {
    
    PreparedStatement ps = null;
    ResultSet rs;
    private JFreeChart grafico;
    private JFrame frame;
    private JPanel jPanel1;
    Dimension d;
    private BufferedImage _image;
    
    public Reportes() {
        frame = new JFrame();
        frame.setSize(500, 400);
        frame.setLayout(new FlowLayout());
        jPanel1 = new JPanel();
        jPanel1.setLayout(new FlowLayout());
        frame.add(jPanel1);
    }
    
    public boolean crearPdf() {
        Connection c1 = Conexion.conectar();
        if (c1 != null) {
            try {
                Statement st = c1.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = st.executeQuery("select * from Cliente");
                Document documento = new Document(PageSize.LETTER, 30, 30, 0, 15);
                PdfWriter Writer = null;
                Writer = PdfWriter.getInstance(documento, new FileOutputStream("C://Users//johnc//Downloads//reporte.pdf"));
                documento.open();
                documento.addTitle("Reporte Clientes");
                documento.addAuthor("Alvarado García Jorge");
                Paragraph parrafo = new Paragraph();
                parrafo.setAlignment(Paragraph.ALIGN_CENTER);
                parrafo.setFont(FontFactory.getFont("Arial", 20, Font.BOLD, BaseColor.PINK));
                parrafo.add("\n\nReporte de Clientes \n\n");
                documento.add(parrafo);
                try {
                    //Obtenemos la instancia de la imagen
                    Image imagen = Image.getInstance("C://Users//johnc//OneDrive//Documents//NetBeansProjects//Grupo Modelo//web//bootstrap//img//gm.png");
                    imagen.setAlignment(Image.ALIGN_CENTER);
                    imagen.scalePercent(45);
                    documento.add(imagen);
                } catch (DocumentException | IOException e) {
                    e.getMessage();
                }
                parrafo = new Paragraph();
                parrafo.add("\n\n");
                documento.add(parrafo);
                if (rs.next()) {
                    int columnas = rs.getMetaData().getColumnCount();
                    rs.last();
                    int filas = rs.getRow();
                    PdfPTable table = new PdfPTable(columnas);
                    for (int c = 0; c < columnas; c++) {
                        table.addCell(" " + rs.getMetaData().getColumnName(c + 1));
                    }
                    rs.first();
                    for (int c = 0; c < filas; c++) {
                        for (int r = 0; r < columnas; r++) {
                            table.addCell(" " + rs.getString(r + 1));
                        }
                        rs.next();
                    }
                    documento.add(table);
                    documento.close();
                    return true;
                } else {
                    return false;
                }
            } catch (DocumentException | FileNotFoundException | SQLException ex) {
                
                System.out.println("Exception: " + ex);
                
                return false;
            }
        } else {
            return false;
        }
    }
    
    public boolean crearGrafica() {
        d = frame.getSize();
        DefaultCategoryDataset datos = new DefaultCategoryDataset();
        try {
            Connection cn = Conexion.conectar();
            Statement st = cn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            rs = st.executeQuery("select Cancelacion,COUNT(*) Registros from Distribucion group by Cancelacion");
            while (rs.next()) {
                
                String act = null;
                String n = rs.getString(1);
                
                if (n.equals("1")) {
                    act = "Venta Cancelado";
                } else if (n.equals("2")) {
                    act = "Venta Realizada";
                }
                
                datos.addValue(rs.getDouble(2), act, "");
            }
            grafico = ChartFactory.createBarChart3D("Registro de Ventas",
                    "Cancelacion", "N° de Ventas", datos,
                    PlotOrientation.VERTICAL, true, true, true);
            crear_grafico(d);
            JLabel j = new JLabel();
            j.setBounds(0, 0, d.width, d.height);
            cargar_grafico(j);
            jPanel1.removeAll();
            jPanel1.add(j);
            jPanel1.repaint();
            try {
                ChartUtilities.saveChartAsJPEG(new File("C://Users//johnc//Downloads//graficoBarra.jpg"),
                        grafico, d.width, d.height);
            } catch (IOException ex) {
                System.out.println("Erro1: " + ex);
                return false;
            }
            return true;
        } catch (SQLException e) {
            System.out.println("Error grafico: " + e);
            return false;
        }
    }
    
    private String crear_grafico(Dimension d) {
        this.d = d;
        _image = grafico.createBufferedImage(this.d.width,
                this.d.height);
        return ("Grafico creado");
    }
    
    private void cargar_grafico(JLabel j) {
        ImageIcon imagenFondo = new ImageIcon(_image);
        j.setIcon(imagenFondo);
    }
    
}
