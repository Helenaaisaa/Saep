<!DOCTYPE html>
<html>
<head>
    <title>Nova Sala</title>
</head>
<body>

    <h1>Nova Sala</h1>

    <form action="/veiculos" method="POST">

        @csrf

        <label>Número da Sala:</label>
        <input type="text" name="num_sala">

        <br><br>

        <label>Bloco:</label>
        <input type="text" name="bloco">

        <br><br>


        <label>Empresa:</label>

        <select name="empresa_id">

            <option value="">
                Selecione uma empresa
            </option>

            @foreach($empresas as $empresa)

                <option value="{{ $empresa->id }}">
                    {{ $empresa->nome }}
                </option>

            @endforeach

        </select>

        <br><br>

        <button type="submit">
            Cadastrar
        </button>

    </form>

    <br>

    <a href="/empresas/listar">
        Voltar
    </a>

</body>
</html>