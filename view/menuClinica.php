<nav class="navbar navbar-expand-md navbar-light bg-transparent p-4 m-2">
  <a class="navbar-brand" href="<?php echo URL.'inicio';?>">Início</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link"  href="<?php echo URL; ?>">Inicío <span class="sr-only">(página atual)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link"  href="<?php echo URL.'#'; ?>">Consultar castrações</a>
      </li>
    </ul>
    <form class="form-inline ms-auto my-2 my-lg-0">
      <a href="<?php echo URL.'#'; ?>" class="btn btn-success my-2 my-sm-0">Encerrar Sessão</a>
    </form>
  </div>
</nav>