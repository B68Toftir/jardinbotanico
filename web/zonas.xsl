<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="legacy-compat" encoding="utf-8"/>

<xsl:template match="/">
    
<!--
      Autor : Carles Rodriguez i Rovira
      Asignatura : LMGSI
      Unidad UD 4
      Tarea : TaEv 02 - XSLT
      Ver website : https://b68toftir.github.io/jardinbotanico/
      Fecha : 2025-12-01
-->    
    
  <html lang="es">
      
    <!-- Variable para la hora y la trasformamos de String a Integer-->
    <xsl:variable name="hora_String" select="'10:00'"/>
    <xsl:variable name="hora_int" select="number(translate($hora_String, ':', ''))"/>

    <head>
      <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
      <meta charset="utf-8"/>
      <meta name="description" content="Página principal" />
      <title>titulo de la web</title>
    </head>
    
    <body>
      <header>
        <img src= "../img/logotipo.png" alt= "Reservas" />
        <a href="zonas.xml">Zonas</a>
        <a href="plantas.xml">Plantas</a>
        <a href="actividades.xml">Actividades</a>
      </header>
      
      <main>
        <h1>ZONAS</h1>
        
        <table>
          <tr>
            <th>ZONA</th>
            <th>UBICACIÓN</th>
            <th>HORARIO</th>
          </tr>
          
          <!-- Uso una rutina, que elimina los dos puntos de la hora y lo pasa a String, luego lo pasa a numero y compara si es 1000(10:00) o menor -->
            <xsl:apply-templates select="jardinBotanico/zonas/zona[number(translate(horarioapertura, ':', '')) &lt;= $hora_int]"/>
        </table>
        
      </main>
      <footer>
        <address>&#169; Desarrollado por info@birt.eus</address>
      </footer>
    </body>
  </html>
</xsl:template>
  
  <!-- TEMPLATE PARA LAS ZONAS, en este caso solo muestra zonas que abren a las 10:00 o antes -->
  <!-- Uso un xsl:if para constrolar si aparece la palabra Exterior en ubicacion -->
  <xsl:template match="zona">
    <tr>
      <td><xsl:value-of select="nombre"/></td>
      <td>
        <xsl:if test="contains(ubicacion, 'Exterior')">
          <xsl:attribute name="style">color: blue;</xsl:attribute>
        </xsl:if>
        <xsl:value-of select="ubicacion"/>
      </td>
      <td><xsl:value-of select="horarioapertura"/>-<xsl:value-of select="horariocierre"/></td>
    </tr>
  </xsl:template>
  
</xsl:stylesheet>