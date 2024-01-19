export interface IUserRequest{
    name: string
    email: string
    cpf: string
    password: string
    createdAt: Date
    updatedAt: Date
  }
  
  export interface IUser {
    id: number
    name: string
    email: string
    password: string
    is_adm: boolean
    is_active: boolean
    createdAt: Date
    updatedAt: Date
  }
  
  export interface IUserLogin {
    email: string
    password: string
  }
  
  export interface IUserUpdate {
    name?: string
    email?: string
    password?: string
    cpf?: string
    is_active?: boolean
  }