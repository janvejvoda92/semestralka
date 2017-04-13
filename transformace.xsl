<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : transformace.xsl
    Created on : 9. dubna 2017, 9:44
    Author     : honza
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/save_hry">
        <html>
            <head>
                <title>transformace.xsl</title>
            </head>
            <body>
                <h1>save hry</h1>
                <ul>
                    <il>
                        
                        <xsl:for-each select="hra">
                            <xsl:sort select="o_savu/datum_ulozeni/datum" order="descending"/>
                            {
                            <xsl:sort select="o_savu/datum_ulozeni/cas" order="descending"/>
                            {
                            <h2>hra</h2>
                            <ul>
                                <il>
                                    <h3>o savu</h3>
                                    <xsl:for-each select="o_savu">
                                        id savu:<xsl:value-of select="id"/>
                                        <br/>
                                        jmeno postavy:<xsl:value-of select="jmeno_postavy"/>-
                                        agresivita postavy:<xsl:value-of select="jmeno_postavy/@agrese"/><br/>
                                        rasa:<xsl:value-of select="rasa"/>-
                                        bonusové schpvosti rasy:<xsl:value-of select="rasa/@schopnost"/><br/>
                                        urověň postavy:<xsl:value-of select="uroven"/>-
                                        titul úrovně:<xsl:value-of select="uroven/@titul"/><br/>
                                        datum uložení:<xsl:value-of select="datum_ulozeni/datum"/><br/>
                                        cas uložení:<xsl:value-of select="datum_ulozeni/cas"/>
                                    </xsl:for-each>
                                </il>
                                <li>
                                    <h3>nastavení hry</h3>
                                    <xsl:for-each select="nastaveni_hry">
                                        <ul>
                                            <il>
                                                <h4>obtížnost</h4>
                                                obtížnost hry:<xsl:value-of select="obtiznost"/>
                                            </il>
                                            <il>
                                                <h4>grafika</h4>
                                                <xsl:for-each select="grafika">
                                                    rozlišení:<xsl:value-of select="rozliseni"/>
                                                    <br/>
                                                    jas obrazu:<xsl:value-of select="jas"/>
                                                    <br/>
                                                    detaily krajiny: <xsl:value-of select="detail_krajiny"/>
                                                    <br/>
                                                    odraz od vody: <xsl:value-of select="odraz_vody"/>
                                                    <br/>
                                                    kvalita odrazu od vody: <xsl:value-of select="kvalita_odrazu_vody"/>
                                                    <br/>
                                                    dohledová vzdálenost:<xsl:value-of select="dohled"/>
                                                </xsl:for-each>
                                            </il>
                                            <il>
                                                <h4>zobrazení</h4>
                                                <xsl:for-each select="zobrazeni">
                                                    množství krve ve hře:<xsl:value-of select="mnozstvi_krve"/>
                                                    <br/>
                                                    zobrazení kompasu:<xsl:value-of select="kompas"/>
                                                    <br/>
                                                    zobrazení navigačního kříže:<xsl:value-of select="navigacni_kriz"/>
                                                    <br/>
                                                    zobrazení mini mapy: <xsl:value-of select="mini_mapa"/>
                                                    <br/>
                                                    zobrazení titulků:<xsl:value-of select="titulky"/>
                                                </xsl:for-each>
                                            </il>
                                            <il>
                                                <h4>hudba</h4>
                                                <xsl:for-each select="hudba">
                                                    hlasitost zvuků ve hře: <xsl:value-of select="zvuky_uroven"/>
                                                    <br/>
                                                    hlasitost hudby ve hře:<xsl:value-of select="hudba_uroven"/>
                                                    <br/>
                                                    hlasitost řeči ve hře:<xsl:value-of select="hlas_uroven"/>
                                                </xsl:for-each>
                                            </il>
                                            <il>
                                                <h4>ovládání</h4>
                                                <xsl:for-each select="ovladani">
                                                    nastaveni myši pro ruku: <xsl:value-of select="mys"/>
                                                    <br/>
                                                    citlivost ovládání myši:<xsl:value-of select="citlivost_mysi"/>
                                                    <br/>
                                                    rozvrženi klávesnice: <xsl:value-of select="klavesnice"/>
                                                </xsl:for-each>
                                            </il>
                                        </ul>
                                        
                                       
                                    </xsl:for-each>
                                </li>
                                <il>
                                    <h3>postava</h3>
                                    <xsl:for-each select="postava">
                                        <ul>
                                            <il>
                                                <h4>informace o postavě</h4>
                                                <xsl:for-each select="info_o_postave">
                                                    <h5>síly postavy</h5>  
                                                    <xsl:for-each select="sily_postavy"> 
                                                        <table>
                                                            <tr>
                                                                <th></th>
                                                                <th>obnova</th>
                                                                <th>aktuální množství</th>
                                                                <th>celkové množství</th>
                                                            </tr>
                                                            <tr>
                                                                <th>zdraví postavy</th>
                                                                <td>
                                                                    <xsl:value-of select="zdravy_cel/@obnova_zdravy"/>
                                                                </td>
                                                                <td>
                                                                    <xsl:value-of select="zdravy_ak"/>
                                                                </td>
                                                                <td>
                                                                    <xsl:value-of select="zdravy_cel"/>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th>mana postavy</th>
                                                                <td>
                                                                    <xsl:value-of select="mana_cel/@obnova_many"/>
                                                                </td>
                                                                <td>
                                                                    <xsl:value-of select="mana_ak"/>
                                                                </td>
                                                                <td>
                                                                    <xsl:value-of select="mana_cel"/>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th>výdrž postavy</th>
                                                                <td>
                                                                    <xsl:value-of select="vydrz_cel/@obnova_vydrze"/>
                                                                </td>
                                                                <td>
                                                                    <xsl:value-of select="vydrz_ak"/>
                                                                </td>
                                                                <td>
                                                                    <xsl:value-of select="vydrz_cel"/>
                                                                </td>
                                                            </tr>
                                                        </table> 
                                                    </xsl:for-each>
                                                    <h5>vyzbroj postavy</h5>
                                                    <xsl:for-each select="vyzbroj">
                                                        <table>
                                                            <tr>
                                                                <th></th>
                                                                <th>předmět</th>
                                                            </tr>
                                                            <tr>
                                                                <th>hlava</th>
                                                                <td>
                                                                    <xsl:value-of select="hlava"/>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th>hrudník</th>
                                                                <td>
                                                                    <xsl:value-of select="hrudnik"/>
                                                                </td>
                                                                <td>
                                                                    <xsl:value-of select="hrudnik/@odev_pod_zbroji"/>
                                                                </td>
                                                                <td>
                                                                    <xsl:value-of select="hrudnik/@vylepseni"/>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th>ruce</th>
                                                                <td>
                                                                    <xsl:value-of select="ruce"/>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th>boty</th>
                                                                <td>
                                                                    <xsl:value-of select="boty"/>
                                                                </td>
                                                                <td>
                                                                    <xsl:value-of select="boty/@vyska_bot"/>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </xsl:for-each>
                                                    <h5>šperky</h5>
                                                    <xsl:for-each select="sperky">
                                                        <table>
                                                            <tr>
                                                                <th></th>
                                                                <th>předmět</th>
                                                            </tr>
                                                            <tr>
                                                                <th>hlava</th>
                                                                <td>
                                                                    <xsl:value-of select="hlava"/>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th>krk</th>
                                                                <td>
                                                                    <xsl:value-of select="krk"/>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th>ruce</th>
                                                                <td>
                                                                    <xsl:value-of select="ruce"/>
                                                                </td>
                                                            </tr>
                                                             
                                                        </table>
                                                    </xsl:for-each>
                                                    <h5>vyzbrojení postavy (ruce)</h5>
                                                    <xsl:for-each select="vyzbrojeni">
                                                        vyzbrojeni pravé ruky: <xsl:value-of select="prava_ruka"/><br/>
                                                        vyzbrajeni levé ruky: <xsl:value-of select="leva_ruka"/>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                            </il>
                                            <il>
                                                <h4>data postavy</h4>
                                                <xsl:for-each select="data_postava">
                                                    množství mincí:<xsl:value-of select="mince"/>
                                                    <br/>
                                                    titul postavy:<xsl:value-of select="titul"/> - 
                                                    postavení ve společnosti: <xsl:value-of select="titul/@postaveni"/>
                                                    <br/>
                                                    zaměstnání postyvy: <xsl:value-of select="povolani"/>
                                                    <br/>
                                                    momentálně aktivní úkol:<xsl:value-of select="aktivni_ukol"/> - 
                                                    fáze vykonávaného úkolu: <xsl:value-of select="aktivni_ukol/@faze_ukolu"/>
                                                    <br/>
                                                    oddanost postavy:<xsl:value-of select="frakce"/>
                                                    <br/>
                                                    je postava hledaná?:<xsl:value-of select="hledany"/>
                                                    <br/>
                                                    aktualní pozice posty:<xsl:value-of select="lokace"/>
                                                </xsl:for-each>
                                            </il>
                                        </ul>
                                    </xsl:for-each>
                                </il>
                            </ul>
                            }
                            }
                            <xsl:if test="position() != last()">,</xsl:if>
                        </xsl:for-each>
                    </il>
                </ul>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
