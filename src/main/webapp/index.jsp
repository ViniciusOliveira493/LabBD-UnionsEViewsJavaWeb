<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Unions e Views</title>
	<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<nav>
	
	</nav>
	<main>
		<div class = "center form">
			<div align="center">
				<p ><h1>Buscar Viagem</h1></p>
			</div>
			<div align="center">
				<form action="viagem" method = "POST">
					<div class="linha">
						<input type="number" name = "txtCodigo" id = "txtCodigo" placeholder = "Digite o código da Viagem">
					</div>
					<div class="linha">
						<input type = "submit" name="btnSubmitO" id = "btnSubmitO" value = "Buscar por Ônibus" > 
						<input type = "submit" name="btnSubmitV" id = "btnSubmitV" value = "Buscar por Viagem" > 
					</div>					
				</form>
			</div>
		</div>
		<c:if test="${not empty onibus}">	
			<div class = "dados">
				<table id="tbDados" name="tbDados">
					<thead>
						<tr>
							<th>
								Código da Viagem
							</th>
							<th>
								Nome do Motorista
							</th>
							<th>
								Placa do Ônibus
							</th>
							<th>
								Marca do Ônibus
							</th>
							<th>
								Ano do Ônibus
							</th>
							<th>
								Descrição do Ônibus
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								${onibus.codViagem}
							</td>
							<td>
								${onibus.nomeMotorista}
							</td>
							<td>
								${onibus.placa}
							</td>
							<td>
								${onibus.marca}
							</td>
							<td>
								${onibus.ano}
							</td>
							<td>
								${onibus.descricao}
							</td>
						</tr>
					</tbody>
				</table>
			</div>	
		</c:if>	
		
		<c:if test="${not empty viagem}">	
			<div class = "dados">
				<table id="tbDados" name="tbDados">
					<thead>
						<tr>
							<th>
								Código da Viagem
							</th>
							<th>
								Placa do Ônibus
							</th>
							<th>
								Hora de Saída
							</th>
							<th>
								Hora de Chegada
							</th>
							<th>
								Local de Partida
							</th>
							<th>
								Destino
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								${viagem.codigo}
							</td>
							<td>
								${viagem.placaOnibus}
							</td>
							<td>
								${viagem.horaSaida}
							</td>
							<td>
								${viagem.horaChegada}
							</td>
							<td>
								${viagem.partida}
							</td>
							<td>
								${viagem.destino}
							</td>
						</tr>
					</tbody>
				</table>
			</div>	
		</c:if>	
	</main>
	<footer>
	
	</footer>
</body>
</html>