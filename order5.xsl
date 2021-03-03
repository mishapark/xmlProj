<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <xsl:template match="/">

      <html>
         <head>
            <title>Title of the page</title>
         </head>

         <body>
            <h1></h1>
            <table border="1">
            <tr><th>ID</th> <th>Status</th> <th>Item</th></tr>
               <xsl:for-each select="//order">
               <tr>
                  <td><xsl:value-of select="customerid"/></td>
                  <td><xsl:value-of select="status"/></td>
                  <td>
                    <table border="1">
                            <xsl:for-each select="item">
                                <xsl:choose>
                                    <xsl:when test="@instock = 'N'">
                                        <tr style="background-color: red">
                                            <td>
                                                <span>Name: </span><xsl:value-of select="name"/><br/>
                                                <span>Price: </span><xsl:value-of select="price"/><br/>
                                                <span>Qty: </span><xsl:value-of select="qty"/><br/>
                                            </td>
                                        </tr>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <tr>
                                            <td>
                                            <span>Name: </span><xsl:value-of select="name"/><br/>
                                            <span>Price: </span><xsl:value-of select="price"/><br/>
                                            <span>Qty: </span><xsl:value-of select="qty"/><br/>
                                            </td>
                                        </tr>
                                    </xsl:otherwise>
                                  </xsl:choose>
                            </xsl:for-each>
                    </table>
                  </td>
               </tr>
               </xsl:for-each>
            </table>
         </body>

      </html>
   </xsl:template>

</xsl:stylesheet>