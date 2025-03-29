Algoritmo Sistema_de_costos_Juan_Opazo
	//Hay varios comandos "escribir" que están vacíos, es para saltar espacios y que quede más entendible para el usuario
	
	// Defino las variables y constantes
	definir PRODUCTOS, CODIGODESCUENTO, DESTINO, lista Como Cadena
	definir PRECIOFIJO, CUPONDESCUENTO, DESCUENTOCANTIDAD, CANTIDADPARADESCUENTO, IVA, COSTOENVIO, PESO, RECARGOPORPESO Como Real
	definir precio, cantidad, cantidadCliente, cantidadTotal, descuentoPorCantidad, descuentoPorCupon, impuesto, pesoTotal, costoDeEnvioPeso, costoDeEnvioDestino, i  Como Real
	definir producto, cuponCliente, comunaCliente Como Caracter
	definir validacionProducto, validacionCupon, validacionDestino Como Logico
	
	dimension PRODUCTOS[4], CODIGODESCUENTO[2], DESTINO[5], PRECIOFIJO[4], CUPONDESCUENTO[2], COSTOENVIO[5], PESO[4]
	dimension cantidad[4]
	
	// Defino los productos
	PRODUCTOS[1] <- "Leche"
	PRODUCTOS[2] <- "Arroz"
	PRODUCTOS[3] <- "Fideos"
	PRODUCTOS[4] <- "Pollo"
	
	// Defino el precio de los productos
	PRECIOFIJO[1] <- 1000
	PRECIOFIJO[2] <- 1600
	PRECIOFIJO[3] <- 700
	PRECIOFIJO[4] <- 4000
	
	// Defino el peso de cada artículo
	PESO[1] <- 1
	PESO[2] <- 1
	PESO[3] <- 0.2
	PESO[4] <- 0.8
	
	// Defino los destinos posibles de envío
	DESTINO[1] <- "Puente Alto"
	DESTINO[2] <- "La Florida"
	DESTINO[3] <- "Macul"
	DESTINO[4] <- "La Pintana"
	DESTINO[5] <- "Pirque"
	
	// Defino el cargo fijo por envío a los destinos
	COSTOENVIO[1] <- 1000
	COSTOENVIO[2] <- 1500
	COSTOENVIO[3] <- 1700
	COSTOENVIO[4] <- 1400
	COSTOENVIO[5] <- 1600
	
	// Defino los cupones de descuento validos
	CODIGODESCUENTO[1] <- "Descuento5"
	CUPONDESCUENTO[1] <- 0.05
	CODIGODESCUENTO[2] <- "Descuento.10"
	CUPONDESCUENTO[2] <- 0.10
	
	
	// Defino el descuento por cantidad
	DESCUENTOCANTIDAD <- 0.05
	CANTIDADPARADESCUENTO <- 5
	
	// Defino las demás variables / constantes
	IVA <- 0.19
	precio <- 0
	cantidad[1] <- 0
	cantidad[2] <- 0
	cantidad[3] <- 0
	cantidad[4] <- 0
	descuentoPorCantidad <- 0
	descuentoPorCupon <- 0
	impuesto <- 0
	costoDeEnvioPeso <- 0
	costoDeEnvioDestino <- 0
	pesoTotal <- 0
	RECARGOPORPESO <- 100
	validacionProducto <- falso
	validacionCupon <- falso
	validacionDestino <- falso
	cantidadCliente <- 0
	cantidadTotal <- 0
	
	// Le indico al cliente como funciona el sistema
	escribir "Bienvenido a nuestra tienda, por favor escriba el nombre del artículo que desea comprar:"
	escribir "  "
	escribir "  - Leche entera Colun, ",PESO[1],"lt: $",PRECIOFIJO[1]," (valor bruto) - ingrese: ",PRODUCTOS[1]
	escribir "  - Arroz tucapel grado 2, ",PESO[2],"kg: $",PRECIOFIJO[2]," (valor bruto) - ingrese: ",PRODUCTOS[2]
	escribir "  - Fideos corbatitas carozzi, ",PESO[3] * 100,"gr: $",PRECIOFIJO[3]," (valor bruto) - ingrese: ",PRODUCTOS[3]
	escribir "  - Pechuga de pollo deshuesada SuperPollo, ",PESO[4],"gr: $",PRECIOFIJO[4]," (valor bruto) - ingrese: ",PRODUCTOS[4]
	escribir "  "
	escribir "* Por la compra de al menos ",CANTIDADPARADESCUENTO," unidades de productos en total, obten un ",DESCUENTOCANTIDAD*100,"% de descuento"
	leer producto
	
	// Dentro de este bucle, permito al cliente ingresar varios productos, hasta que ingrese "N"
	mientras Mayusculas(producto) <> "N"
		
		// Reviso si el nombre del producto ingresado existe, si es verdadero pregunto la cantidad a comprar y lo agrego al carrito"
		para i <- 1 hasta 4 Hacer
			si Mayusculas(producto) = Mayusculas(PRODUCTOS[i]) Entonces
				validacionProducto <- verdadero
				Escribir "Por favor indique la cantidad de ",PRODUCTOS[i]," a comprar"
				leer cantidadCliente
				mientras cantidadCliente <= 0
					Escribir "Debe llevar al menos una unidad del producto ",PRODUCTOS[i],", ingrese nuevamente la cantidad"
					leer cantidadCliente
				FinMientras
				cantidad[i] <- cantidad[i] + cantidadCliente
				Escribir "Se agregaron correctamente ",cantidad[i]," unidad(es) de ",PRODUCTOS[i]," al carrito de compras"
			FinSi
		FinPara
		si validacionProducto = falso Entonces
			Escribir "El nombre del producto ingresado no es válido, por favor intente nuevamente"
		FinSi
		validacionProducto = falso
		
		// Guardo el carrito actual en la variable lista y lo muestro: producto, cantidad y precio total
		lista <- "Carrito actual: "
		para i <- 1 hasta 4
			lista <- lista + " [" + PRODUCTOS[i] + ": " + ConvertirATexto(cantidad[i]) + " Total: $" + ConvertirATexto(cantidad[i] * PRECIOFIJO[i]) + "] "
		FinPara
		escribir lista
		// escribir "Carrito actual: [",PRODUCTOS[1],": ",cantidad[1]," Total: $",cantidad[1] * PRECIOFIJO[1],"] - ", "[",PRODUCTOS[2],": ",cantidad[2]," Total: $",cantidad[2] * PRECIOFIJO[2],"] - ","[",PRODUCTOS[3],": ",cantidad[3]," Total: $",cantidad[3] * PRECIOFIJO[3],"] - ","[",PRODUCTOS[4],": ",cantidad[4]," Total: $",cantidad[4] * PRECIOFIJO[4],"]"
		Escribir  "Para ingresar más productos, ingrese el nombre del producto deseado, para avanzar al siguiente paso escriba N"
		leer producto
	
	FinMientras
	
	// Cuando sale del bucle, le muestro el total bruto a pagar y aplico un descuento si lleva más de X unidades
	escribir "El detalle actual de su compra es: "
	escribir "  "
	para i <- 1 hasta 4
		escribir PRODUCTOS[i],": ",cantidad[i]," unidad(es), valor total $",PRECIOFIJO[i] * cantidad[i]
		precio = precio + PRECIOFIJO[i] * cantidad[i]
		cantidadTotal = cantidadTotal + cantidad[i]
	FinPara
	Escribir  "El valor total de su compra es de $",precio
	si cantidadTotal >= CANTIDADPARADESCUENTO Entonces
		descuentoPorCantidad = precio * DESCUENTOCANTIDAD
		Escribir  "  "
		Escribir "Debido a que lleva ",cantidadTotal," unidades de productos, se aplicó un descuento del ",DESCUENTOCANTIDAD*100,"%, descuento aplicado $",descuentoPorCantidad,", nuevo monto a pagar $", precio - descuentoPorCantidad
	FinSi
	
	// Pregunto si tiene un cupón de descuento, dado el ejercicio dejé el nombre de los cupones en claro para que el evaluador los pueda ver
	// Ojo que este descuento se aplica sobre el descuento anterior, por ejemplo, si en el descuento por cantidad aplico un 5% de descuento y ahora vuelvo a aplicar el 5% de descuento, no es un 10% si no un (100% - 5%) * 5% = 4,75% -> 9,75% entre ambos descuentos, esto lo hice así porque así está en el ejemplo pero en estricto rigor creo que es erróneo
	Escribir  "  "
	Escribir  "Si tiene un cupón de descuento, por favor ingréselo, en caso contrario escriba N"
	Escribir  "-- -- -- Cupones activos (para que no tenga que buscar en el código) [ ",CODIGODESCUENTO[1]," ] & [ ",CODIGODESCUENTO[2]," ]"
	Leer cuponCliente
	
	// Realizo la validación del cupón y entro en un bucle hasta que el cupón es válido o el usuario ingresa "N"
	mientras Mayusculas(cuponCliente) <> "N" y validacionCupon = falso
		para i <- 1 hasta 2
			si Mayusculas(cuponCliente) = Mayusculas(CODIGODESCUENTO[i])
				descuentoPorCupon = (precio - descuentoPorCantidad) * CUPONDESCUENTO[i]
				Escribir "Cupón ",CODIGODESCUENTO[i]," es válido, se aplicó un descuento del ",CUPONDESCUENTO[i]*100,"%, equivalente a $",descuentoPorCupon,", el nuevo monto a pagar es de $",precio-descuentoPorCantidad-descuentoPorCupon
				validacionCupon = Verdadero			
			FinSi
		FinPara
			Si Mayusculas(cuponCliente) = "N" o validacionCupon = Falso
				Escribir "El cupón ingresado no es válido, por favor inténtelo nuevamente, para salir escriba N"
				leer cuponCliente
			FinSi
	FinMientras
	
	// Calculo el iva de la venta, considerando que los precios indicados son brutos / ojo que al transporte no le puse IVA porque en el ejemplo no lo hacen
	impuesto = redon(((precio-descuentoPorCantidad-descuentoPorCupon) / (1 + IVA))*IVA)
	
	// Calculo el peso de los artículos y recargo por peso
	para i <- 1 hasta 4
		pesoTotal = pesoTotal + cantidad[i] * PESO[i]
	FinPara
	costoDeEnvioPeso = RECARGOPORPESO * pesoTotal
	
	// Muestro los costos por peso y destino y solicito que ingrese la comuna de envío
	Escribir  "  "
	Escribir "El peso total de sus artículos es de ",pesoTotal,"kg, siendo el recargo por peso de $",costoDeEnvioPeso,", (El costo de de $100 por kg)"
	Escribir "El monto a pagar considerando el recargo por peso en kg es de $",precio-descuentoPorCantidad-descuentoPorCupon+costoDeEnvioPeso
	Escribir "  "
	escribir "Por favor seleccione la comuna de destino de su pedido"
	
	para i <- 1 hasta 4
		Escribir "Comuna de destino: ",DESTINO[i],", costo de envío $",COSTOENVIO[i],"   Escriba: ",DESTINO[i]
	FinPara
	
	leer comunaCliente
	
	mientras validacionDestino = falso
	para i <- 1 hasta 5
		si Mayusculas(comunaCliente) = Mayusculas(DESTINO[i])
			Escribir "Envío será realizado a ",DESTINO[i]
			costoDeEnvioDestino = COSTOENVIO[i]
			validacionDestino = Verdadero
		FinSi
	FinPara
		si validacionDestino = Falso
			escribir "Nombre de comuna inválido, por favor escriba una de las comunas de la lista"
			leer comunaCliente
		FinSi
	FinMientras
	
	escribir "  "
	escribir "El detalle de su compra es el siguiente: "
	lista <- ""
	para i <- 1 hasta 4
		lista <- lista + "[" + PRODUCTOS[i] + ": " + ConvertirATexto(cantidad[i]) + " Total: $" + ConvertirATexto(cantidad[i] * PRECIOFIJO[i]) + "]  "
	FinPara
	escribir lista
	escribir "  "
	Escribir  "Monto bruto $",precio
	escribir "  "
	escribir "Descuentos"
	escribir "    Descuento por cantidad $",-descuentoPorCantidad
	escribir "    Cupón de descuento $",-descuentoPorCupon
	escribir "  "
	escribir "Monto bruto con descuentos $" precio-descuentoPorCantidad-descuentoPorCupon
	escribir "    Composición monto bruto"
	escribir "        Monto neto $" precio-descuentoPorCantidad-descuentoPorCupon-impuesto
	escribir "        IVA aplicado (",IVA*100,"%) $",impuesto
	escribir "  "
	escribir "Costos de envío"
	escribir "    Recargo por peso en kg $",costoDeEnvioPeso
	escribir "    Recargo por comuna de destino $",costoDeEnvioDestino
	escribir "  "
	escribir "Monto total a pagar $",precio-descuentoPorCantidad-descuentoPorCupon+costoDeEnvioPeso+costoDeEnvioDestino
	escribir "  "
	escribir "Gracias por su compra!"	
FinAlgoritmo
