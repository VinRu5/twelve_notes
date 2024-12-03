abstract class Mapper<E, D> {
  E toModel(D dto);

  D toDTO(E entity);
}
