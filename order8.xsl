<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <xsl:template match="/">
   <html>
       <head>
           <title>Title of the page</title>
           <link rel="stylesheet" type="text/css" href="order8.css"/>
         </head>

         <body>
            <h1></h1>
            <table border="1">
            <tr><th>Order ID</th> <th>Customer ID</th> <th>Status</th> <th>Items</th></tr>
               <xsl:for-each select="//order">
               <tr>
                  <td class="ordId"><xsl:value-of select="@ordId"/></td>
                  <td class="custId"><xsl:value-of select="customerid"/></td>
                  <td class="status"><xsl:value-of select="status"/></td>
                  <td>
                        <table border="0" class="tableItem">
                            <xsl:for-each select="item">
                            <xsl:sort select="@itemid"/>
                            <xsl:choose>
                                <xsl:when test="@instock = 'N'">
                                    <tr style="background-color: #ff7373">
                                        <td width="200" class="orderItem">
                                           <span>Stock: </span><xsl:value-of select="@instock"/><br/>
                                           <span>Item ID: </span><xsl:value-of select="@itemid"/><br/>
                                           <span>Name: </span><xsl:value-of select="name"/><br/>
                                           <span>Price: </span><xsl:value-of select="price"/><br/>
                                           <span>Qty: </span><xsl:value-of select="qty"/><br/>
                                        </td>
                                     </tr> 
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <tr>
                                            <td width="200" class="orderItem">
                                               <span>Stock: </span><xsl:value-of select="@instock"/><br/>
                                               <span>Item ID: </span><xsl:value-of select="@itemid"/><br/>
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